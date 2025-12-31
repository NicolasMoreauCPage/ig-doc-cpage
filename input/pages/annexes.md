




# Annexes



## Exemple de sushi-config.yaml

```yaml
id: ig-fhir-doc-cpage
canonical: https://www.cpage.fr/ig/ig-fhir-doc-cpage
name: IG FHIR Doc CPage
status: draft
version: 0.1.0
date: 2025-12-30
title: Guide documentaire IG FHIR
publisher:
  name: CPage
  url: https://www.cpage.fr
contact:
  - name: CPage
    telecom:
      - system: email
        value: contact@cpage.fr
description: >-
  Ce guide propose une documentation complète sur la création, la publication et la maintenance des guides d’implémentation FHIR, à destination de la communauté de l’entreprise.
license: CC-BY-4.0
fhirVersion: 4.0.1
dependencies:
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

[Un lien utile](https://hl7.org/fhir)
```



## Liens complémentaires

- [Guide HL7 IG Guidance (Best Practices)](https://build.fhir.org/ig/FHIR/ig-guidance/best-practice.html)