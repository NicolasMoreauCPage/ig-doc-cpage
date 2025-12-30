# Outils et technologies pour les IG FHIR

## FSH (FHIR Shorthand)
FSH est un langage dédié à la définition concise des profils, extensions, instances et autres artefacts FHIR. Il permet de décrire de façon lisible et maintenable la structure des ressources.

- [Documentation FSH](https://build.fhir.org/ig/HL7/fhir-shorthand/)
- [FSH School](https://fshschool.org/)

## SUSHI
SUSHI est l’outil de compilation des fichiers FSH en ressources FHIR (JSON/XML). Il s’utilise en ligne de commande ou via FSH School.

- Commande de base : `sushi .`
- Générer les snapshots : `sushi -s .`

## GoFSH
GoFSH permet de convertir des ressources FHIR existantes (JSON/XML) en FSH, facilitant la migration ou la rétro-ingénierie.

- Commande de base : `gofsh .`
- Pour traiter JSON et XML : `gofsh -t json-and-xml .`

## IG Publisher
L’IG Publisher génère le site web de l’IG à partir de la structure de dossiers et fichiers (markdown, FSH, ressources, images…).

- [Documentation officielle](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)
- Nécessite Java 17+ et Jekyll pour la génération locale.

## Autres outils
- [HL7 IG Template Base](https://github.com/HL7/ig-template-base)
- [NPM Package Specification](https://confluence.hl7.org/display/FHIR/NPM+Package+Specification)
- [Clinical Quality Language (CQL)](https://cql.hl7.org/)

Pour plus de détails, consultez la section "Liens utiles".