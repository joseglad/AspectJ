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

Pour cela, il faut tout d'abord que la classe qui souhaite avoir les caractéristiques d'un Singleton implémente notre interface Singleton. Cette interface nous sert simplement de filtre. En effet, dans la coupe on utilise l'opérateur + qui accepte n'importe quel sous-type de l'interface Singleton.

Par la suite, pour le premier appel pour l'instanciation de cette classe, une instance sera créée et stockée dans l'aspect, plus précisément dans une HashMap. 

Pour les appels suivants à cette même classe, c'est l'instance stockée qui sera retournée. Cela est possible grâce à la HashMap qui utilise la classe comme clef et l'instance de cette classe comme valeur. Ce qui est intéressant est de vérifier avec la classe comme clef s'il y a une instance de cette classe dans la HashMap. Cela permet de vérifier si une première instance de la classe a déjà été créée ou non. Si c'est le cas, on n'en crée pas un autre.

Par conséquent, s'il n'y a pas une première instance de la classe dans la HashMap, on laisse le processus de création s'exécuter, sinon on retourne l'instance contenue dans la HashMap.

## V - Diagramme d'échange de messages

Ce diagramme affiche les appels et les retours d'appels de méthodes entre les objets de l'application durant son exécution. Il permet d'observer le déroulement de l'application.

Pour générer ce diagramme, j'ai tout d'abord créé une coupe qui accepte toutes les méthodes publiques du package exercice2.etape1.
A chaque appel à une méthode, je récupère la source, la cible, la méthode et le type de retour de la méthode.

Pour avoir un affichage correct, j'ai ajouté deux méthodes privées. Une méthode giveACorrectSize qui ajuste à une taille donnée une chaîne de caractères avec un caractère répété. Et une méthode checkAddition qui ajoute un objet à la HashMap s'il n'y est pas contenu. Elle fournit aussi un rang aux différents objets pour savoir où commencer le tracé de la flèche d'appel et où l'arrêter (inversement pour la flèche de retour). Dans le point de jonction (advice), on vérifie l'ajout des deux objets appelant et appelé pour permettre cette affichage.

Grâce à la méthode giveACorrectsize, je peux nommer la flèche d'appel avec le nom de la méthode et la flèche de retour avec le nom de l'object retourné. Pour obtenir ces deux flèches, il faut afficher la flèche d'appel avant le proceed() et juste après la flèche de retour. Les noms des différens acteurs de ce diagramme sont affichés tous les cinq appels de méthodes.

On peut modifier la taille du diagramme, en paramétrant les attributs de l'aspect Diagram.

## VI - Exécution de l'application

Depuis une console, se placer à la racine du projet et lancer la commande:
> java -jar diagram.jar

