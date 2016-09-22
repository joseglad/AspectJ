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

Je lance une simulation de l'application pour tester son fonctionnement et les différentes contraintes entre classes.

## III - Refactorisation de l'application à l'aide d'un aspect

Un aspect permet la refactorisation du code d'une application.

La refactorisation aide à la réutilisation de code et à la suppression de dépendances.

Dans l'application précédente, la méthode d'ajout d'une commande à un client créait une dépendance.
Une autre dépendance est la méthode de suppression de client ayant un ou plusieurs commandes (besoin d'une liste de commandes dans clients).

Ces deux contraintes rendent utiles la refactorisation de code.


## IV - Design pattern Singleton

Nous allons implémenter ce design pattern Singleton grâce à AspectJ.
Pour cela, il faut tout d'abord que la classe qui souhaite avoir les caractéristiques d'un Singleton implémente notre interface Singleton. Cette interface nous servira de filtre.







## V - Diagramme d'échange de messages


## VI - Exécution de l'application





Pour la partie contrainte pour la suppression de client ayant un ou plusieurs commandes, il manque des tests pour voir si l'exception se lève bien.

-------------

Mise en place du gestionnaire:
- singletons orders et clients réalisés
- 
