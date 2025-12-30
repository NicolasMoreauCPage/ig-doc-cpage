# Déploiement & publication

Cette page explique comment fonctionne la génération automatique (CI/CD) et la publication de votre IG FHIR sur GitHub Pages.

## Fonctionnement
- À chaque push ou pull request sur la branche `main`, le workflow `.github/workflows/build-ig.yml` compile automatiquement l'IG.
- Le site HTML généré est publié sur GitHub Pages.

## Lien du site IG compilé
- Après chaque build, le site est accessible à l'adresse :
  `https://<utilisateur>.github.io/<nom-du-repo>/`
  Exemple : `https://nicolasmoreaucpage.github.io/ig-fhir-doc-cpage/`

## Consulter le statut du build
- Onglet **Actions** du dépôt GitHub.
- Les artefacts générés (site complet) sont téléchargeables dans chaque run.

## Personnalisation
- Le workflow CI/CD est défini dans `.github/workflows/build-ig.yml`.
- Il utilise Java, Ruby/Jekyll, et le Publisher HL7.
- Pour modifier le déploiement, adaptez ce fichier YAML.

## Dépannage
- Voir les logs dans l'onglet Actions.
- Vérifier la configuration de GitHub Pages dans les paramètres du dépôt.

## Voir aussi
- [GitHub Pages](https://docs.github.com/fr/pages)
- [GitHub Actions](https://docs.github.com/fr/actions)
