import networkx as nx
from neo4j import GraphDatabase

def to_nx_graph(neo4j_driver, query):

    with neo4j_driver.session() as session:
        results = session.run(query).graph()

    # initialize Graph object
    G = nx.Graph()

    # process nodes
    nodes = list(results._nodes.values())
    for node in nodes:
        G.add_node(node.id, 
                label=node._properties.get("Name"),
                type=list(node._labels)[0],
                **node._properties)

    # process relationships
    rels = list(results._relationships.values())
    for rel in rels:
        G.add_edge(rel.start_node.id, 
                rel.end_node.id, 
                key=rel.id, 
                title=rel.type, 
                **rel._properties)
    return G
