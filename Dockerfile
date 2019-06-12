FROM tensorflow/tensorflow:1.13.1-py3

RUN useradd -ms /bin/bash protein

WORKDIR /home/protein

RUN apt-get update && apt-get install -y git

RUN pip install git+git://github.com/mikepm35/biopython.git@all_changes
RUN pip install boto3 requests pandas sklearn seaborn matplotlib jupyter

COPY protein_contact_notebook.ipynb experiments.json pair_labels.csv sse_features.csv sse_neighbors.csv sse_pairs.csv ./

RUN chown -R protein:protein ./
USER protein

#CMD jupyter notebook --ip=0.0.0.0 --port=8099 --no-browser --NotebookApp.token=''
CMD jupyter nbconvert --ExecutePreprocessor.timeout=200000 --to notebook --execute protein_contact_notebook.ipynb
