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
Une autre dépendance est la méthode de suppression de client. Avant de supprimer un client, on doit vérifier s'il a un ou plusieurs commandes donc on aura besoin d'une liste de commandes dans client.

Ces deux contraintes rendent utiles la refactorisation de code.


## IV - Design pattern Singleton

Nous allons implémenter ce design pattern Singleton grâce à AspectJ.

Pour cela, il faut tout d'abord que la classe qui souhaite avoir les caractéristiques d'un Singleton implémente notre interface Singleton. Cette interface nous servira de filtre.

Par la suite, pour le premier appel pour l'instanciation de cette classe, un objet sera créé et stocké dans l'aspect. Pour les appels suivants de cette même classe, c'est l'objet stocké qui sera retourné.

## V - Diagramme d'échange de messages

Ce diagramme affiche les appels et les retours d'appels de méthodes entre les objets de l'application durant son exécution. Il permet d'observer le déroulement de l'application.

## VI - Exécution de l'application

Deux exécutables.

Depuis une console, se placer à la racine du projet et lancer la commande:
> ./diagram
- 
