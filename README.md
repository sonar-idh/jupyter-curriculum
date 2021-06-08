<h1 align="center">
  SoNAR (IDH) - Jupyter Curriculum
</h1>
<h2>Interfaces to Data for Historical Social Network Analysis and Research
</h2>

<p align="center">Interactively learn how to use the <b>SoNAR (IDH)</b> Database to conduct your own <b>historical network analysis (HNA)</b>. This curriculum provides an introduction into <b>Python</b>, the graph database platform <b>Neo4j</b> and the corresponding query language <b>Cypher</b>.</p>

<center>

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/sonar-idh/jupyter-curriculum/HEAD) [![made-with-jupyter](https://img.shields.io/badge/Made%20with-Jupyter-1f425f.svg)](https://www.jupyter.org/) [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity) [![License: ???](https://img.shields.io/badge/License--yellow.svg)](https://opensource.org/licenses/?)

</center>

# Table of Content

- [Table of Content](#table-of-content)
- [Objective of the Curriculum](#objective-of-the-curriculum)
  - [What is SoNAR (IDH)?](#what-is-sonar-idh)
  - [Content of the Curriculum](#content-of-the-curriculum)
- [How to use the Curriculum?](#how-to-use-the-curriculum)

# Objective of the Curriculum

This curriculum was created to provide a comprehensible Introduction to using the [SoNAR (IDH)](https://sonar.fh-potsdam.de/) database with the help of Python.

## What is SoNAR (IDH)?
SoNAR (IDH) is short for *Interfaces to Data for Historical Social Network Analysis and Research*. SoNAR (IDH) examines and evaluates approaches to build and operate an advanced research technology environment supporting Historical Network Analysis and related research. Project partners from various fields – historiography, information visualization, artificial intelligence and computer sciences as well as information science – work on this topic from their respective perspective.

More details on the research project SoNAR (IDH) can be found [here](https://sonar.fh-potsdam.de/).

## Content of the Curriculum

The curriculum consists of 5 notebooks, each covering different aspects relevant for conducting network analyses with the SoNAR (IDH) database. 

| Notebook | Content | Interactive Version| Static Version |
|----------|---------|------------| ---------- |
|Notebook 1 - Jupyter and Python | Basic introduction to Python and Jupyter. Can be skipped in case you worked with Python before| [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/sonar-idh/jupyter-curriculum/HEAD?filepath=%2Fnotebooks%2FNotebook%201%20-%20Jupyter%20and%20Python.ipynb)| [![nbviewer](https://raw.githubusercontent.com/jupyter/design/master/logos/Badges/nbviewer_badge.svg)](https://nbviewer.jupyter.org/...)|
|Notebook 2 - Historical Network Analysis | Basic introduction to graph theory and HNA. Example of network analysis based on a network of Nobel Laureates. |[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/sonar-idh/jupyter-curriculum/HEAD?filepath=%2Fnotebooks%2FNotebook%202%20-%20Historical%20Network%20Analysis.ipynb)| [![nbviewer](https://raw.githubusercontent.com/jupyter/design/master/logos/Badges/nbviewer_badge.svg)](https://nbviewer.jupyter.org/...) |
| Notebook 3 - SoNAR (IDH) | How to access and query SoNAR (IDH) data. Introduction to Neo4j and Cypher Query Language. Examples of data exploration, descriptive analyses and comple queries. | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/sonar-idh/jupyter-curriculum/HEAD?filepath=%2Fnotebooks%2FNotebook%203%20-%20SoNAR%20(IDH).ipynb)| [![nbviewer](https://raw.githubusercontent.com/jupyter/design/master/logos/Badges/nbviewer_badge.svg)](https://nbviewer.jupyter.org/...) |
| Notebook 4 - History of Physiology | Example case of analysing historical network of physiologist. Depiction of exploratory approach to HNA. | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/sonar-idh/jupyter-curriculum/HEAD?filepath=%2Fnotebooks%2FNotebook%203%20-%20SoNAR%20(IDH).ipynb) |
| Notebook 5 - History of Economy | tba | tba | [![nbviewer](https://raw.githubusercontent.com/jupyter/design/master/logos/Badges/nbviewer_badge.svg)](https://nbviewer.jupyter.org/...) |

# How to use the Curriculum?

There are multiple ways to use this curriculum: 

1. **Static websites** 
   
   In the table [above](#Content-of-the-Curriculum), you find links to *static* versions of each notebook. Use this way to access the notebooks in case you do not want to run code in an interactive environment but only want to read up the content of the notebooks. 

2. **Interactive Binder Versions**

    [The Binder Project](https://jupyter.org/binder) enables you to work with the notebooks of this curriculum in a cloud hosted interactive session. This way you can execute code and reproduce the contents of the notebooks. You also can write new code and do the exercises right in the notebooks - without installing anything on your computer. The respective links to the binder versions of the notebooks can be found in the table [above](#Content-of-the-Curriculum). 

    You can also open the full repository structure with binder by clicking on this button:
    [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/sonar-idh/jupyter-curriculum/HEAD)

3. **Interactive Local Versions**

    You also can check out this repository and build the docker container of the curriculum. This way you can manipulate the code completely to your liking and make the changes permanent. 

    To do so, you need to do the following steps:

   1. [Clone repository](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository-from-github/cloning-a-repository)
   2. Start [Docker](https://www.docker.com)
   3. From base path of repository, run the following command in the Terminal:
    
    ```
    docker-compose up
    ```
