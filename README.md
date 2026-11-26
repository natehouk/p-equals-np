# p-equals-np
The resolution of the MAD Paradox in 2015 led to the solution of the P vs. NP problem.

## The site

[pequalsnp.org](https://pequalsnp.org) is a single static page: the thesis, four claims, and a margin graph that draws the argument (one path, a fork that holds both answers, and the merge where it collapses).

```
public/
  index.html      the page
  styles.css      all styling, light and dark, print
  404.html        not-found page
  fonts/          Libertinus Serif and Sans (SIL OFL 1.1, licences included)
  favicon.svg, og.png, robots.txt, sitemap.xml
netlify.toml      publish directory and response headers
```

There is no build step and no JavaScript.

## Preview locally

```sh
python3 -m http.server 8000 --directory public
```

Then open http://localhost:8000.

## Deploy

Netlify serves `public/` on every push to `master`. Headers, including the content security policy, are set in `netlify.toml`. The policy allows only same-origin styles, fonts and images, so inline `style` attributes and scripts will not run.

## Editing notes

- Complexity classes are wrapped in `<span class="cc">` so they are set upright in sans, as `\mathsf` does in print.
- The margin graph is drawn in CSS. Its position is tied to the title: `--rail-x` in `styles.css` places the path under the stem of the P, so change the two together.
- `og.png` is a 1200 × 630 capture of the top of the page. Re-capture it if the masthead changes.
