---
title: "Versionnement d'un IG"
layout: page
---

# Versionnement d'un Implementation Guide (IG)

Ce document explique les bonnes pratiques pour numéroter, publier et maintenir les versions d'un Implementation Guide FHIR.

## Principes généraux

- Utilisez le versionnage sémantique (SemVer) quand c'est pertinent : `MAJOR.MINOR.PATCH`.
  - **MAJOR** : changements incompatibles nécessitant une migration (ex : retrait d'éléments majeurs, refonte de profils).
  - **MINOR** : ajout de fonctionnalités compatibles (ex : nouveaux profils, extensions non perturbantes).
  - **PATCH** : corrections et clarifications (ex : correction d'exemples, orthographe, documentation).
- Dans le contexte FHIR, la valeur `packageId` et `version` de votre `ImplementationGuide` doivent être cohérentes avec le package publié.
- Documentez les changements dans un fichier `CHANGELOG.md` et dans les notes de publication.

## Champs FHIR importants

- `ImplementationGuide.packageId` : identifiant du package (ex : `fr.cpage.ig.myproject`).
- `ImplementationGuide.version` : version du package (ex : `1.2.0`).
- `ImplementationGuide.url` : l'URL canonique de l'IG (ne pas changer à chaque version sauf si rupture majeure).

## Stratégies pratiques

- Travaillez sur des branches de fonctionnalité et utilisez des tags Git pour marquer des releases (`v1.2.0`).
- Publiez un nouveau package NPM/tgz pour chaque release (voir page "Utiliser les packages").
- Pour les versions de développement, utilisez un suffixe (par ex. `1.2.0-dev20251201`) ou gardez un canal `main` avec versions non taggées.

## Rétrocompatibilité

- Documentez les changements de rupture et fournissez un guide de migration.
- Maintenez des exemples pour plusieurs versions si nécessaire.

## CI/CD recommandé

- Automatisez la génération du package (SUSHI + npm pack / fhir IG Publisher) sur chaque tag Git.
- Exécutez la validation QA du publisher et signalez les erreurs avant publication.
- Déployez les pages statiques sur un hébergement (GitHub Pages, GitLab Pages, serveur web interne) et conservez les packages dans un repository de packages privé/public selon la politique.

## Exemples

- Tagging et publication rapide :

```bash
# Créer un tag
git tag -a v1.2.0 -m "Release v1.2.0"
 git push origin v1.2.0

# Générer le package npm/tgz depuis le dossier du IG
 npm pack
# Publier sur le registre (si public)
 npm publish --registry https://registry.npmjs.org/
```

- Recommandation : conservez un mirror privé des packages NPM pour vos IG internes.


***

Retour à l'accueil : [Accueil](index.html)
