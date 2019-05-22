# Elm - Problems faced with solutions ( on Mac )

- `main` function: 

    * **Error:** Doesn't recognise Html.program
    * **Solution:** Elm 0.18 uses Html.program but Elm 0.19 doesn't. Either downgrade *[1]* to 0.18 or use Browser.sandbox.

- Adding new dependency:

    * **Error:** Need to add a source directory or new dependency to elm-package.json.
    * **Solution:** You can do that by doing `elm package install evancz/elm-effects `
        or by adding `evancz/elm-effects` to `elm-package.json` and then doing just elm package install.

- Downgrage from Elm 0.19 to 0.18 *[1]*

    * **Solution:** If you have downloaded the `installer-for-mac.pkg` for installing Elm 0.19 follow:
        - Remove the `elm` binary from `/usr/local/bin`
        - Download Elm 0.18 installer from [Here](https://web.archive.org/web/20180714175914id_/https://guide.elm-lang.org/install.html) and follow [this](https://web.archive.org/web/20180714175914id_/https://guide.elm-lang.org/) documentation.

- elm-package.json

    * **Points to note:**
        -   