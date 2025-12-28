# ig-template-cpage — Template documentation (CPage)

This document explains what the template contains, which files control the visual rendering, and how an IG uses the template to build the final HTML output.

## Purpose
The template repository `ig-template-cpage` provides the visual presentation layer used by an Implementation Guide (IG) when published with the FHIR IG Publisher. It contains fragments, layout templates, stylesheets, images, and other assets.

## Key folders and files
- `template/` — Jekyll-compatible fragments used by the publisher.
  - `template/includes/fragment-header.html` — header fragment (logo, title)
  - `template/includes/fragment-navbar.html` — navbar fragment
  - `template/includes/fragment-breadcrumb.html` — breadcrumb fragment
  - `template/includes/fragment-footer.html` — footer fragment
  - `template/includes/fragment-pagebegin.html` — (optional) overrides or compact page start
  - `template/content/assets/css/project.css` — main template CSS
  - `template/content/assets/images/` — logos and images

- `_layouts/` — (if present) Jekyll layouts to wrap pages
- `package/` — template package metadata (package.json)

## How the IG uses the template
1. In the IG repo (`FHIR_IG`), `ig.ini` points to the template via the `template` property. Example:
   ```ini
   template = https://github.com/NicolasMoreauCPage/ig-template-cpage
   ```
2. When you run the FHIR IG Publisher (e.g. `java -jar publisher.jar -ig ig.ini`), the publisher loads the template package from the provided URL or from the package cache.
3. The publisher copies the template fragments and assets into a temporary pages tree and runs Jekyll to render the final HTML using the template's fragments and CSS.
4. The generated files are written into the IG repo's `output/` folder.

## Where to change visuals (recommended)
- Update `template/content/assets/css/project.css` for large-scale visual changes (colors, layout, spacing).
- Edit fragments in `template/includes/` to change structural pieces (navbar, header, footer).
- Replace images in `template/content/assets/images/` to update logos.

## Development workflow
- Make changes in the template repo and push to GitHub.
- In the IG repository, run the publisher with `-reload-cache` to force the publisher to fetch the latest template package:
  ```bash
  java -jar input-cache/publisher.jar -ig ig.ini -reload-cache
  ```
- Inspect `output/` and iterate on the template.

## Notes
- The template is independent from the IG content. The IG contains the data resources (profiles, valuesets), while the template is only responsible for rendering.
- If you need dynamic behavior beyond static fragments (JS-driven), add JS assets to `template/content/assets/js/` and include them in the template fragments.

If you want, I can add a short checklist for visual improvements (typography, spacing, responsive tweaks) and produce a small demo CSS patch.