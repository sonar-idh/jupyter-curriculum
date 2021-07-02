import networkx as nx
from neo4j import GraphDatabase
import matplotlib.pyplot as plt
from matplotlib.colors import rgb2hex
from itertools import count
from matplotlib.patches import Circle
import numpy as np

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

def draw_graph(graph_object, pos = "kamada_kawai_layout", node_labels=None, edge_labels=None, node_color_attribute = "type", color_map= plt.cm.plasma, plot_size=[10,10]):

    if pos == "kamada_kawai_layout":
        pos = nx.nx.kamada_kawai_layout(graph_object)

    # setup node_colors
    groups = set(nx.get_node_attributes(graph_object,node_color_attribute).values())
    group_ids = np.array(range(len(groups)))
    if len(group_ids) > 1:
        group_ids_norm = (group_ids - np.min(group_ids))/np.ptp(group_ids)
    else:
        group_ids_norm = group_ids
    mapping = dict(zip(groups, group_ids_norm))
    node_colors = [mapping[graph_object.nodes()[n][node_color_attribute]] for n in graph_object.nodes()]

    # define plot options
    node_options = {
        "pos":  pos,
        "alpha": 1,
        "node_size": 150,
        "alpha": 0.5,
        "node_color":  node_colors, 
        "cmap": color_map
    }

    node_label_options = {
            "pos": pos,
            "labels": node_labels,
            "font_size": 11
        }

    edge_options = {
                "pos": pos,
                "width": 1.5,
                "alpha": 0.2,
        }

    plt.figure(figsize=plot_size)
    plt.margins(x=0.1, y = 0.1)

    # draw the network
    nx.draw_networkx_nodes(graph_object, **node_options)

    if node_labels:
        nx.draw_networkx_labels(graph_object, **node_label_options)

    nx.draw_networkx_edges(graph_object, **edge_options)

    if edge_labels:
        nx.draw_networkx_edge_labels(graph_object, pos = pos, edge_labels=edge_labels) # declare the usage ofthe edge labels

    # create custom legend according to color_map

    geom_list = [Circle([], color = rgb2hex(color_map(float(mapping[term])))) for term in groups]
    plt.legend(geom_list, groups)

    # show the plot
    plt.show()