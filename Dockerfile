FROM tensorflow/tensorflow:1.13.1-py3

RUN useradd -ms /bin/bash protein

WORKDIR /home/protein

RUN apt-get update && apt-get install -y git

RUN pip install git+git://github.com/mikepm35/biopython.git@all_changes
RUN pip install boto3 requests pandas sklearn seaborn matplotlib jupyter

COPY protein_contact_notebook.ipynb experiments.json pair_labels.csv sse_features.csv sse_neighbors.csv sse_pairs.csv ./

RUN chown -R protein:protein ./
USER protein

RUN jupyter nbconvert --to script protein_contact_notebook.ipynb 

CMD ["python","-u","protein_contact_notebook.py"]