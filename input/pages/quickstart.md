

# Prise en main rapide : créer un IG FHIR

Cette page vous guide pour créer un Implementation Guide FHIR en quelques minutes. Suivez les étapes, même sans expertise préalable.

## Pour qui ?

Le guide s’adresse aux débutants, modélisateurs, développeurs, experts métier et architectes. Adaptez votre lecture selon votre profil.

Ce tutoriel utilise le template IG CPage (réservé aux projets internes). Pour un projet externe, utilisez le template HL7 : https://github.com/HL7/ig-template-base


## Outils utilisés

- FSH (FHIR Shorthand) : langage de définition des ressources FHIR ([doc](https://build.fhir.org/ig/HL7/fhir-shorthand/), [éditeur en ligne](https://fshschool.org/))
- SUSHI : compilateur FSH vers ressources FHIR ([doc](https://fshschool.org/docs/sushi/)), commande : `sushi .`
- IG Publisher : génération du site web de l’IG ([doc](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)), commande : `./_genonce.sh`


## Prérequis

- Environnement configuré : voir la page [Installation](installation.html)
- Dépôt cloné : travaillez dans un dossier IG (comme celui-ci)


## Configuration après clonage du template IG

Après avoir cloné le template IG CPage, personnalisez les fichiers de configuration pour éviter les conflits et adapter le guide à votre projet.

### 1. Choisir l’ID dans sushi-config.yaml

L’ID doit respecter les règles des templates FHIR IG et être unique globalement :

```yaml
id: ig-[organisation]-[standard]-[type]-[projet]
```

**Composants du modèle :**

1. **Préfixe obligatoire** : `ig-` (pour Implementation Guide)
3. **Standard** : technologie sur laquelle s'appuie l'IG :
   - `fhir` : pour FHIR pur
   - `hprimxml` : pour HPRIM XML
   - `hl7v2` : pour HL7 v2
   - `ihepam` : pour IHE PAM
   - `cda` : pour CDA
   - `general` : pour usage général/multi-standards
4. **Type** : nature du contenu :
   - `spec` : spécification technique
   - `doc` : documentation
   - `guide` : guide d'implémentation
   - `profile` : profils uniquement
5. **Projet** : nom spécifique du projet (ex: `patient-management`, `radiologie`, `2025`)

**Règles strictes à respecter :**
- **Format obligatoire** : `ig-[minuscules]-[tirets]-uniquement`
- **Caractères autorisés** : lettres minuscules, chiffres, tirets uniquement
- **Pas d'espaces** : remplacez par des tirets
- **Pas de caractères spéciaux** : accents, apostrophes, etc. interdits
- **Unicité globale** : votre ID doit être unique sur tout FHIR (évitez les noms génériques)

**Exemple concret du template CPage (général) :**
- `ig-cpage-general-template` (organisation: cpage, standard: general, type: template)

**Exemples invalides :**
- `mon-projet-ig` ❌ (ne commence pas par `ig-`)
- `IG-Mon-Projet` ❌ (majuscules interdites)
- `ig_mon_projet` ❌ (tiret bas interdit)
- `ig-mon-projet-fhir` ❌ (trop générique, risque de conflit)

### 2. Configuration du sushi-config.yaml


Modifiez les informations principales :

**Exemple concret du template CPage :**
```yaml
id: ig-cpage-general-template
canonical: https://www.cpage.fr/ig/ig-cpage-general-template
name: IG Template CPage
title: "Template IG CPage"
publisher:
  name: CPage
  url: https://www.cpage.fr
description: >-
  Template général d'un IG CPage applicable à tous les standards.
version: 0.1.0
date: 2025-12-30
copyrightYear: 2025
```

**Points importants :**
- `canonical` : URL où sera publié votre IG (GitHub Pages)
- `publisher` : Vos informations d'organisation
- `description` : Expliquez l'objectif de votre IG
- Gardez `fhirVersion: 4.0.1` et `jurisdiction: urn:iso:std:iso:3166#FR`

### 3. Configuration du ig.ini

Ce fichier contrôle la génération finale :

```ini
[IG]
ig = fsh-generated/resources/ImplementationGuide-mon-projet-ig-fhir.json
template = https://github.com/NicolasMoreauCPage/ig-template-cpage
usage-stats-opt-out = true
copyright-year = 2025
```

**À modifier :**
- `ig = fsh-generated/resources/ImplementationGuide-[VOTRE-ID].json` : Utilisez le même ID que dans sushi-config (format `ig-*`)
- `copyright-year` : Année en cours
- Gardez le `template` pointant vers le template CPage

**Exemple avec ID `ig-cpage-general-template` :**
```ini
[IG]
ig = fsh-generated/resources/ImplementationGuide-ig-cpage-fhir-template.json
template = https://github.com/NicolasMoreauCPage/ig-template-cpage
usage-stats-opt-out = true
copyright-year = 2025
```

### 4. Lien de visualisation GitHub après push

Après avoir poussé vos changements :

1. **Allez sur GitHub** : Ouvrez votre dépôt
2. **Settings > Pages** : Vérifiez que GitHub Pages est activé sur la branche `gh-pages`
3. **URL de visualisation** : `https://[votre-nom-utilisateur].github.io/[nom-du-depot]/`

**Exemple :**
- Dépôt : `https://github.com/monuser/mon-projet-ig`
- Site : `https://monuser.github.io/mon-projet-ig/`

### 5. Autres configurations importantes

#### package.json (si présent)
```json
{
  "name": "mon-projet-ig",
  "version": "0.1.0",
  "description": "Mon IG FHIR"
}
```

#### .gitignore
Assurez-vous d'ignorer :
```
output/
input-cache/
temp/
*.log
```

#### GitHub Actions (optionnel)
Si vous voulez l'automatisation, gardez le workflow dans `.github/workflows/`.

### Vérification de la configuration

Testez votre configuration :
```bash
# Compilez avec SUSHI
sushi .

# Générez le site
./_genonce.sh

# Ouvrez le résultat
open output/index.html
```

**Erreurs courantes :**
- **Format ID incorrect** : Doit commencer par `ig-` et respecter le kebab-case
- **Caractères interdits** : Pas de majuscules, espaces, ou caractères spéciaux
- **ID dupliqué** : Vérifiez que votre ID n'existe pas déjà sur registry.fhir.org
- **Canonical URL incorrect** : Doit correspondre à l'ID (sans le `ig-` souvent)

## Étape 1 : Comprendre la structure

Votre projet IG contient :
- `sushi-config.yaml` : Configuration principale
- `input/pages/` : Pages de documentation (Markdown)
- `input/fsh/` : Définition des artefacts (FSH)
- `ig.ini` : Configuration IG Publisher

## Étape 2 : Ajouter une page de documentation

1. **Créez un fichier** dans `input/pages/` :
   ```bash
   touch input/pages/ma-premiere-page.md
   ```

2. **Écrivez du contenu** :
   ```markdown
   # Ma première page

   Bienvenue dans mon IG FHIR !

   ## Objectif
   Cette page explique comment utiliser ce guide d'implémentation.

   ## Liens utiles
   - [Documentation FHIR](https://www.hl7.org/fhir/)
   - [Bonnes pratiques](bonnes-pratiques.html)
   ```

3. **Déclarez la page** dans `sushi-config.yaml` :
   ```yaml
   pages:
     ma-premiere-page.md:
       title: "Ma première page"
   ```

4. **Ajoutez au menu** dans `sushi-config.yaml` :
   ```yaml
   menu:
     "Ma première page": ma-premiere-page.html
   ```

## Étape 3 : Créer un premier profil

1. **Créez le dossier FSH** :
   ```bash
   mkdir -p input/fsh
   ```

2. **Créez un fichier profil** `input/fsh/profiles.fsh` :
   ```fsh
   Profile: MonPremierPatient
   Parent: Patient
   Id: mon-premier-patient
   Title: "Mon premier profil Patient"
   Description: "Exemple simple de profil FHIR"

   * name 1..* MS // Le nom est obligatoire
   * name.family 1..1 // Le nom de famille est obligatoire
   ```

3. **Compilez avec SUSHI** :
   ```bash
   sushi .
   ```

   SUSHI génère les fichiers dans `fsh-generated/resources/`.

## Étape 4 : Générer le site

1. **Lancez IG Publisher** :
   ```bash
   ./_genonce.sh
   ```

2. **Ouvrez le résultat** :
   - Le site est dans `output/`
   - Ouvrez `output/index.html` dans votre navigateur

3. **Vérifiez** :
   - Votre nouvelle page apparaît dans le menu
   - Le profil est listé dans la section Profils

## Étape 5 : Publier (optionnel)

Si GitHub Actions est configuré :
1. **Commitez vos changements** :
   ```bash
   git add .
   git commit -m "Ajout première page et profil"
   git push
   ```

2. **Attendez le build** : GitHub Actions génère automatiquement le site sur GitHub Pages

## Félicitations !

Vous venez de créer votre premier IG FHIR avec :

## Utilisation du package IG FHIR (.tgz/.zip) dans les serveurs FHIR

### Qu'est-ce que le package généré ?

Après compilation et publication, votre IG FHIR produit un package NPM (généralement nommé `mon-ig-1.0.0.tgz` ou `.zip`). Ce package est le format standard pour distribuer un Implementation Guide FHIR.

**Contenu du package :**
- Ressources de conformance : StructureDefinition, ValueSet, CodeSystem, CapabilityStatement, etc.
- Un fichier `package.json` : contient l'identifiant du package, la version, la version FHIR, les dépendances, etc.
- Documentation et exemples.

Ce format est reconnu par la plupart des serveurs et outils FHIR modernes (HAPI FHIR, Aidbox, Firely, etc.).

### Comment l'intégrer dans un serveur FHIR ?

Selon la plateforme FHIR utilisée, l'intégration du package IG peut se faire de différentes manières :

#### 1. Import direct du package (.tgz)
Certains serveurs (ex : HAPI FHIR, Aidbox) permettent de charger le package `.tgz` directement via leur interface ou un outil dédié. Les profils, ValueSet, CodeSystem, etc. sont alors enregistrés automatiquement dans le datastore du serveur.

#### 2. Décompression et import manuel
D'autres solutions demandent de décompresser le package, puis d'importer les ressources individuellement (via API REST, script, ou outil comme UploadFIG).

#### Exemple d'intégration dans HAPI FHIR
HAPI FHIR (serveur Java open source) propose plusieurs méthodes pour intégrer un IG :
- **Via l'interface d'administration** : Import du package NPM dans la section "Implementation Guides".
- **Via l'API REST** : Utilisation de l'endpoint `/ImplementationGuide` pour charger les ressources.
- **Via un script** : Décompression du `.tgz` et POST des fichiers JSON sur le serveur.

**Documentation HAPI FHIR** : [Guide officiel](https://hapifhir.io/doc_fhir_implementation_guides.html)

### Bonnes pratiques
- Vérifiez la compatibilité de la version FHIR du package avec celle du serveur.
- Contrôlez les dépendances dans le `package.json`.
- Consultez la documentation de votre serveur pour la procédure exacte d'import.
- Pour les serveurs ne supportant pas l'import direct, utilisez un script pour poster les ressources.

---


## Prochaines étapes

Maintenant que vous maîtrisez les bases :
- [Explorez les bonnes pratiques](bonnes-pratiques.html)
- [Apprenez à créer des extensions](extensions.html)
- [Découvrez les terminologies](terminologies.html)
- [Publiez votre IG](publication-validation.html)

## Dépannage

- **Erreur SUSHI** : Vérifiez la syntaxe FSH
- **Page non visible** : Contrôlez `sushi-config.yaml`
- **Build échoue** : Consultez les logs GitHub Actions

N'hésitez pas à ouvrir une Issue si vous rencontrez des problèmes !

> **Astuce** : Commencez petit, itérez souvent. La perfection vient avec la pratique.
