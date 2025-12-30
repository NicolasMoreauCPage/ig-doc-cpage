# Structure d’un projet IG FHIR

Un projet IG FHIR se compose de plusieurs répertoires et fichiers clés :

- **input/** : Contient les pages de documentation, les ressources FHIR, les images, etc.
- **input/pagecontent/** : Pages markdown de la documentation.
- **input/resources/** : Profils, extensions, terminologies.
- **input/images/** : Illustrations et logos.
- **sushi-config.yaml** : Fichier de configuration principal (nom, description, contact, etc.).
- **ig.ini** : Fichier de configuration du Publisher.

## Exemple de structure

```
input/
  pagecontent/
    index.md
    introduction.md
    ...
  resources/
  images/
sushi-config.yaml
ig.ini
```
