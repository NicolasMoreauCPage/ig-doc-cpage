
# Déploiement et publication

Cette page explique le fonctionnement de la génération automatique (CI/CD) et la publication de l'IG FHIR sur GitHub Pages.

À chaque modification sur la branche `main`, le workflow `.github/workflows/build-ig.yml` compile l'IG et publie le site HTML sur GitHub Pages.

Après chaque build, le site est accessible à l'adresse : `https://<utilisateur>.github.io/<nom-du-repo>/` (exemple : `https://nicolasmoreaucpage.github.io/ig-fhir-doc-cpage/`).

Le statut du build est consultable dans l'onglet Actions du dépôt GitHub. Les artefacts générés sont téléchargeables après chaque exécution.

Le workflow CI/CD est défini dans `.github/workflows/build-ig.yml` et utilise Java, Ruby/Jekyll et le Publisher HL7. Pour modifier le déploiement, adaptez ce fichier YAML.

Pour le dépannage, consultez les logs dans l'onglet Actions et vérifiez la configuration de GitHub Pages dans les paramètres du dépôt.

Voir aussi :
- [GitHub Pages](https://docs.github.com/fr/pages)
- [GitHub Actions](https://docs.github.com/fr/actions)
