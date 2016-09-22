# AspectJ - TP Gestionnaire de commandes

## I - Prise en main d'AspectJ

AspectJ est une extension orientée aspect pour le langage de programmation Java (Wikipédia).

La première approche avec AspectJ consiste à intercepter l'appel et l'exécution d'une méthode d'affichage de message.

Par la suite, à chaque point de joinction intercepté, j'affiche:
* la source
* la cible
* le nom de la méthode
* les paramètres de cette méthode

## II - Développement d'une gestion de commandes et de clientèle

Je crée les différentes classes Client, Clients, Order et Orders sans aspect.

Je lance une simulation de l'application pour tester son fonctionnement et les différentes contraintes des classes.


## IV - Design pattern Singleton

Nous allons implémenter ce design pattern Singleton grâce à AspectJ.





## V - Diagramme d'échange de messages





Pour la partie contrainte pour la suppression de client ayant un ou plusieurs commandes, il manque des tests pour voir si l'exception se lève bien.

-------------

Mise en place du gestionnaire:
- singletons orders et clients réalisés
- 
