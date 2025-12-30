# Bonnes pratiques pour la création d’un IG FHIR

## Généralités
- Rédiger une documentation claire, structurée et accessible à tous les publics visés.
- Versionner chaque publication et maintenir un historique détaillé des évolutions.
- S’appuyer sur les profils nationaux existants (InteropSanté, ANS) quand ils existent.
- Ouvrir l’IG à la contribution et à l’amélioration continue (issues, pull requests).

## Modélisation
- Privilégier la réutilisation des profils, extensions et valeurs existants.
- Documenter chaque choix de modélisation (règles, contraintes, extensions, slicing, etc.).
- Utiliser des noms explicites, stables et conformes aux conventions FHIR pour les artefacts.
- Définir des valeurs par défaut et des contraintes minimales pour garantir l’interopérabilité.
- Ajouter des exemples concrets pour chaque profil ou extension.

## Publication
- Tester localement la génération du site (Publisher, SUSHI) avant toute publication.
- Vérifier la qualité (QA) : liens, images, ressources, validation FHIR, orthographe.
- Publier sur un dépôt public (GitHub, GitLab…) et versionner les releases.
- Fournir un canal de remontée des issues (onglet "Issues" sur GitHub, formulaire dédié).
- Rendre accessibles toutes les versions historiques et documenter les changements (changelog).

## Maintenance
- Mettre à jour régulièrement les dépendances (autres IG, outils, packages) et la documentation.
- Archiver les anciennes versions et garantir leur accessibilité.
- Documenter les changements (changelog, page historique).
- Planifier des revues régulières pour intégrer les retours de la communauté.

## Contribution
- Encourager la participation de la communauté (issues, suggestions, pull requests).
- Décrire clairement le processus de contribution (workflow, validation, publication).
- Valoriser les contributeurs et maintenir une gouvernance ouverte.

Pour plus de détails, voir la section "Publication et validation" et la FAQ.
