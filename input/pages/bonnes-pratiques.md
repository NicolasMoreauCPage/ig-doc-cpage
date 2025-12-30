# Bonnes pratiques FHIR officielles



## Organisation des pages

- Séparez le contenu normatif (critères de conformité) du contenu non-normatif (contexte, cas d’usage, téléchargements, etc.).
- Ajoutez des pages dédiées pour l’arrière-plan, les téléchargements, et regroupez le contenu normatif.



## Rédaction et narration

- Privilégiez la clarté, la concision et l’accessibilité pour les développeurs.
- Évitez le jargon métier ou expliquez-le via des liens ou des définitions.
- Ajoutez des introductions à chaque artefact pour expliquer leur utilité et leur contexte.
- Utilisez des styles narratifs (stu-note, dragon, feedback…) pour attirer l’attention sur des points clés ou avertissements.
- Structurez l’IG pour qu’un développeur puisse comprendre l’essentiel en 30 minutes.
- Utilisez des liens internes et externes pour faciliter la navigation.


### Navigation et structure

- Privilégiez des pages complètes plutôt que de multiples petites pages.
- Ajoutez des ancres explicites pour faciliter le référencement et la navigation.
- Présentez les informations dans un ordre logique, mais prévoyez des liens avant/arrière pour les lecteurs qui naviguent aléatoirement.


### Gestion des artefacts et profils

- Ne créez que les artefacts réellement utiles et maintenables sur le long terme.
- Utilisez mustSupport pour indiquer ce qui doit être supporté, sans surcontraindre la cardinalité.
- Évitez de forcer la présence de meta.profile dans les exemples.
- Documentez les raisons des choix de conception (rationales) pour faciliter la maintenance.


### Exemples et extensions

- Fournissez des exemples couvrant tous les éléments mustSupport et toutes les extensions définies.
- Avant de créer une extension, vérifiez si une extension existante ou un élément du core peut convenir.
- Documentez les usages attendus et les cas limites.


### Sécurité et confidentialité

- Ajoutez une section dédiée expliquant les risques, les contre-mesures et les principes de sécurité/confidentialité applicables.
- Référencez les modules FHIR sur la sécurité et la confidentialité.


### Généralités

- Mettez sous contrôle de version tout le contenu source.
- Relisez et corrigez l’orthographe et la grammaire.
- Indiquez comment contacter la communauté ou l’équipe pour des questions ou suggestions.
- Expliquez les relations avec d’autres IG (dépendances formelles ou informelles).


Pour plus de détails, voir la [documentation officielle FHIR IG Guidance](https://build.fhir.org/ig/FHIR/ig-guidance/best-practice.html).





## 1. Synthèse des principes clés

- **Clarté et accessibilité** : Rédigez pour des développeurs, évitez le jargon, structurez l’information pour une prise en main rapide.
- **Versionning et traçabilité** : Chaque publication doit être versionnée, historisée et documentée.
- **Réutilisation** : Privilégiez les artefacts existants dans l’écosystème de l’entreprise.
- **Qualité et validation** : Testez localement, validez la conformité FHIR, corrigez toutes les erreurs QA avant publication.
- **Ouverture** : Encouragez la contribution, documentez les issues, facilitez la maintenance.



## 2. Organisation et structure du guide

- Séparez le contenu normatif (critères de conformité) du non-normatif (contexte, cas d’usage, téléchargements).
- Ajoutez des pages d’introduction, d’arrière-plan, de téléchargements, et regroupez le contenu normatif.
- Privilégiez des pages complètes et structurées, avec des ancres explicites pour la navigation.
- Présentez les informations dans un ordre logique, mais prévoyez des liens croisés pour les lecteurs qui naviguent aléatoirement.



## 3. Rédaction et narration

- Rédigez de façon concise, claire et orientée développeur.
- Ajoutez des introductions à chaque artefact (profil, extension, etc.) pour expliquer leur utilité et leur contexte.
- Utilisez des styles narratifs (stu-note, dragon, feedback…) pour attirer l’attention sur des points clés ou avertissements.
- Structurez l’IG pour qu’un développeur puisse comprendre l’essentiel en 30 minutes.
- Multipliez les liens internes et externes pour faciliter la navigation et la compréhension.



## 4. Gestion des artefacts et profils

- Ne créez que les artefacts réellement utiles et maintenables sur le long terme.
- Utilisez `mustSupport` pour indiquer ce qui doit être supporté, sans surcontraindre la cardinalité.
- Évitez de forcer la présence de `meta.profile` dans les exemples.
- Documentez les raisons des choix de conception (rationales) pour faciliter la maintenance.
- Utilisez des noms explicites, stables et conformes aux conventions FHIR.



## 5. Exemples et extensions

- Fournissez des exemples couvrant tous les éléments `mustSupport` et toutes les extensions définies.
- Avant de créer une extension, vérifiez si une extension existante ou un élément du core peut convenir.
- Documentez les usages attendus et les cas limites.



## 6. Sécurité et confidentialité

- Ajoutez une section dédiée expliquant les risques, les contre-mesures et les principes de sécurité/confidentialité applicables.
- Référencez les modules FHIR sur la sécurité et la confidentialité.
- Indiquez les exigences spécifiques de votre IG et les risques résiduels.



## 7. Maintenance et gouvernance

- Mettez sous contrôle de version tout le contenu source.
- Relisez et corrigez l’orthographe et la grammaire.
- Documentez les changements (changelog, page historique).
- Planifiez des revues régulières pour intégrer les retours de la communauté.
- Archiver les anciennes versions et garantir leur accessibilité.



## 8. Contribution et support

- Encouragez la participation (issues, suggestions, pull requests).
- Décrivez clairement le processus de contribution (workflow, validation, publication).
- Valorisez les contributeurs et maintenez une gouvernance ouverte.
- Indiquez comment contacter l’équipe ou la communauté pour toute question ou suggestion.



## 9. Liens et ressources

- Ajoutez des liens vers la documentation officielle FHIR, les guides de bonnes pratiques, les outils et les exemples d’IG.
- Expliquez les relations avec d’autres IG (dépendances formelles ou informelles).



## 10. Publication sur GitHub Pages

Pour publier automatiquement votre guide sur GitHub Pages :

- Rendez-vous dans l’onglet **Settings > Pages** de votre dépôt GitHub.
- Dans la section "Build and deployment", choisissez **GitHub Actions** comme source de publication.
- Le reste de la configuration (branche, dossier, workflow) est déjà géré par le fichier GitHub Actions du dépôt.
- Vérifiez l’URL de publication fournie par GitHub après activation.

> Pour plus de détails, voir la documentation officielle : [GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages) et [GitHub Actions for Pages](https://github.com/actions/configure-pages).
