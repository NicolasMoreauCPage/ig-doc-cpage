# Publication, validation et déploiement des IG FHIR

La publication d'un IG FHIR transforme les artefacts en ressource accessible et maintenable. Cette page détaille le processus de validation, publication et déploiement.

## Validation : assurer la qualité

### Types de validation

1. Validation syntaxique :
  - FSH : syntaxe correcte des fichiers `.fsh`
  - JSON/XML : conformité au schéma FHIR
  - Outils : SUSHI (`sushi .`) et IG Publisher
2. Validation sémantique :
  - Profils : cohérence des contraintes
  - Terminologies : codes valides et à jour
  - Exemples : conformité aux profils
3. Validation fonctionnelle :
  - Interopérabilité : tests d'échange entre systèmes
  - Performance : taille des payloads, temps de réponse
  - Sécurité : conformité RGPD, authentification

### Outils de validation

- IG Publisher : validation automatique lors de la génération
- FHIR Validator : outil en ligne de commande
- Touchstone : plateforme de test d'interopérabilité
- Postman/Newman : tests d'API automatisés

### Critères de qualité

- 0 erreur dans les logs IG Publisher
- Exemples valides pour tous les profils
- Terminologies résolues et à jour
- Documentation complète et claire

## Publication : rendre accessible

### Formats de publication

1. Site web (recommandé) :
  - Génération : IG Publisher crée un site Jekyll
  - Hébergement : GitHub Pages, serveur interne
  - Avantages : navigation facile, recherche intégrée
2. Package NPM :
  - Contenu : artefacts FHIR et dépendances
  - Usage : réutilisation dans d'autres IG
  - Publication : registre NPM ou dépôt privé
3. Documentation PDF :
  - Usage : archives, conformité réglementaire
  - Génération : à partir du HTML ou outils spécialisés

### Processus de publication

1. Build local : `./_genonce.sh`
2. Validation : vérifier les logs et rapports QA
3. Tests : validation croisée avec consommateurs
4. **Versionning** : Tag Git, numéro de version
5. **Déploiement** : Push sur branche de publication

## Déploiement automatisé

### GitHub Actions (recommandé)

#### Configuration
- **Workflow** : `.github/workflows/build-ig.yml`
- **Déclencheur** : Push sur `main` ou releases
- **Actions** :
  - Installation SUSHI, Java, Jekyll
  - Génération avec IG Publisher
  - Déploiement sur GitHub Pages

#### Exemple de workflow
```yaml
name: Build IG
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Setup Java
      uses: actions/setup-java@v3
      with:
        java-version: '17'
        distribution: 'temurin'
    - name: Install SUSHI
      run: npm install -g fsh-sushi
    - name: Generate IG
      run: ./_genonce.sh
    - name: Deploy to Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./output
```

### Avantages de l'automatisation

- **Reproductibilité** : Builds identiques
- **Rapidité** : Déploiement en quelques minutes
- **Fiabilité** : Moins d'erreurs manuelles
- **Traçabilité** : Historique complet des builds

## Gestion des versions

### Stratégie de versionning

- **Semantic Versioning** : `MAJEUR.MINEUR.CORRECTIF`
  - **Majeur** : Changements cassants
  - **Mineur** : Nouvelles fonctionnalités
  - **Correctif** : Corrections de bugs

### Processus

1. **Développement** : Branche `main` ou feature branches
2. **Release** : Création d'un tag `v1.2.3`
3. **Publication** : Build automatique du tag
4. **Communication** : Changelog, notes de version

### Gestion des anciennes versions

- **Archivage** : Conserver les builds historiques
- **Accessibilité** : URLs stables pour les anciennes versions
- **Support** : Période de maintenance définie

## Maintenance et évolution

### Surveillance post-publication

- **Métriques** : Nombre de consultations, téléchargements
- **Feedback** : Issues GitHub, retours utilisateurs
- **Mises à jour** : Évolutions FHIR, corrections

### Processus d'évolution

1. **Collecte des besoins** : Issues, demandes utilisateurs
2. **Priorisation** : Impact, urgence, complexité
3. **Développement** : Branches feature, tests
4. **Validation** : Revue, tests d'intégration
5. **Publication** : Nouvelle version

## Bonnes pratiques

- **Validez tôt et souvent** : Intégrez la validation dans votre workflow
- **Automatisez** : CI/CD pour réduire les erreurs
- **Documentez** : Changements, décisions, rationales
- **Communiquez** : Annonces de nouvelles versions
- **Surveillez** : Usage et feedback post-publication

## Ressources complémentaires

- [Guide de publication HL7](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)
- [GitHub Pages](https://docs.github.com/en/pages)
- [Semantic Versioning](https://semver.org/)
- [CI/CD avec GitHub Actions](https://docs.github.com/en/actions)

> **Rappel** : Un IG bien publié est un IG utilisé. La qualité de la publication détermine l'adoption de vos spécifications.
