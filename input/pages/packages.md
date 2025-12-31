---
title: "Utiliser les packages (.tgz / .zip)"
layout: page
---

# Utiliser les packages (.tgz / .zip) pour distribuer un IG

Les Implementation Guides FHIR sont habituellement distribués sous forme de packages NPM (`.tgz`) qui contiennent les artefacts (StructureDefinition, ValueSet, exemples, pages, etc.). Il est aussi possible de fournir des archives `.zip` ou `.tar.gz` selon les besoins.

## Types de packages

- NPM package (.tgz) : format standardisé pour les IG FHIR (recommandé). Peut être publié sur le registre npm ou stocké dans un registre privé.
- Archive ZIP / TGZ : archive contenant le site généré ou le contenu source, utile pour transferts manuels ou intégration avec des serveurs qui n'utilisent pas npm.

## Créer un package NPM (.tgz)

Depuis le répertoire racine du IG (contenant `package.json`) :

```bash
# Générer un package .tgz
npm pack
# Exemple de sortie : my-ig-1.2.0.tgz
```

Pour publier :

```bash
npm publish --registry https://registry.npmjs.org/
```

Pour un registre privé, configurez le `--registry` ou utilisez `npmrc`.

## Créer une archive ZIP/TGZ du site généré

Après génération du site (`ig publisher` ou `./_genonce.sh`), archivez le dossier `output` :

```bash
# ZIP
zip -r my-ig-site-1.2.0.zip output/
# TGZ
tar czf my-ig-site-1.2.0.tar.gz output/
```

## Importer un package dans des serveurs FHIR courants

- HAPI FHIR : ne gère pas nativement les packages IG comme un registry. Vous pouvez déployer les ressources (StructureDefinition, ValueSet) via l'API REST en important les ressources à partir du package.
- IBM FHIR Server : supporte l'import de ressources via l'API REST ; vérifiez la documentation du serveur pour la procédure exacte.
- Vonk / Smile-FHIR : les serveurs peuvent exposer des interfaces d'administration pour importer des bundles ; sinon, chargez les ressources via REST.
- Serveurs compatibles Package Registry : certains serveurs ou outils (ex : Simplifier) peuvent télécharger et utiliser des packages NPM directement.

Exemple : restauration des ressources depuis un package NPM local (script Node.js simple) :

```js
// pseudo-code : lire le .tgz, extraire, parcourir resources/*.json, POST /<resource> au serveur FHIR
```

## Conseils pratiques

- Privilégier le format NPM `.tgz` pour l'interopérabilité avec l'écosystème FHIR.
- Fournir un `package-list.json` si vous maintenez plusieurs packages et versions.
- Pour les déploiements automatisés, utilisez des pipelines CI qui publient sur le registre et/ou transfèrent l'archive vers l'hôte.
- Vérifiez les prérequis du serveur cible avant import (ex : versions FHIR supportées, capacité à gérer profils, quotas).

## Sécurité

- Protégez les registries privés par authentification.
- Ne publiez pas de données patients dans vos packages.

***

Retour à l'accueil : [Accueil](index.html)
