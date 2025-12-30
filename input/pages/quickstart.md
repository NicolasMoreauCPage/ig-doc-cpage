
# Prise en main rapide : Votre premier IG FHIR en 10 minutes

Bienvenue ! Cette page vous guide pour créer votre premier Implementation Guide FHIR en quelques minutes. Pas besoin d'être expert, suivez simplement les étapes.

## Prérequis

- **Environnement configuré** : Si ce n'est pas fait, consultez la page [Installation](installation.html)
- **Dépôt cloné** : Vous travaillez dans un dossier IG (comme celui-ci)

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
- ✅ Une page de documentation
- ✅ Un profil personnalisé
- ✅ Un site web généré

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
