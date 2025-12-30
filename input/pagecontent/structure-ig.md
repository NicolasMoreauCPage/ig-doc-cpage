# Structure d’un Implementation Guide FHIR

Un Implementation Guide (IG) FHIR est un ensemble cohérent de ressources, de profils et de documentation, publié sous forme de site web et de package versionné. Il répond à une problématique d’interopérabilité précise.

## Arborescence type d’un projet IG
- **ig.ini** : fichier de configuration principal
- **sushi-config.yaml** : métadonnées du projet (titre, description, auteurs, version, etc.)
- **input/** : dossier principal des sources
  - **pagecontent/** : pages de documentation (Markdown)
  - **fsh/** : fichiers FSH décrivant profils, extensions, instances…
  - **resources/** : ressources FHIR (JSON/XML)
  - **includes/** : fragments HTML ou Markdown réutilisables
  - **images/** : illustrations, logos, etc.
- **output/** : site web généré

## Bonnes pratiques de structuration
- Un IG par projet spécifique
- Versionner chaque IG indépendamment
- Déclarer explicitement les dépendances (autres IG, profils nationaux…)
- Utiliser des URLs canoniques claires et stables
- Documenter chaque artefact (profils, extensions, valeurs, etc.)

## Exemples d’IG
- [US Core](https://hl7.org/fhir/us/core/)
- [mCODE](http://hl7.org/fhir/us/mcode/)
- [SDC](http://hl7.org/fhir/uv/sdc/index.html)

Voir la section "Liens utiles" pour d’autres exemples.