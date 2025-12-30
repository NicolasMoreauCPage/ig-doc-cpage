# Annexes

## Modèle type de sushi-config.yaml
```yaml
id: ig-fhir-doc-cpage
canonical: https://interop.esante.gouv.fr/ig/ig-fhir-doc-cpage
name: IG FHIR Doc CPage
status: draft
version: 0.1.0
date: 2025-12-30
title: Guide documentaire francophone des IG FHIR
publisher:
  name: CPage
  url: https://www.cpage.fr
contact:
  - name: CPage
    telecom:
      - system: email
        value: ci-sis@esante.gouv.fr
description: >-
  Ce guide propose une documentation complète sur la création, la publication et la maintenance des guides d’implémentation FHIR, à destination de la communauté francophone.
license: CC-BY-4.0
fhirVersion: 4.0.1
dependencies:
  ans.fr.documentation: 0.1.9
  hl7.fhir.uv.howto: 0.1.0
parameters:
  show-inherited-invariants: true
  path-expansion-params: true
```

## Exemple de structure de page Markdown
```markdown
# Titre de la page

## Sous-titre

Paragraphe explicatif…

- Liste à puces
- …

[Un lien utile](https://hl7.org/fhir)
```

## Liens complémentaires
- [Guide ANS](https://interop.esante.gouv.fr/ig/documentation/)
- [Guide HL7 IG Guidance](https://build.fhir.org/ig/FHIR/ig-guidance/index.html)