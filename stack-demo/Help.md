# Elm - Problems faced with solutions ( on Mac )

### `main` function:  
    * **Error:** Module `Html` does not expose `Program` in `main = Html.program{..}`
    * **Solution:** Elm 0.18 uses Html.program but Elm 0.19 doesn't. Either downgrade *[1]* to 0.18 or use Browser.sandbox like this:  
    Add import statement:  
            `import Browser exposing (sandbox)`
    And now use use sandbox: Note that we are not using Never - as in old code samples, but are using () instead:

    main : Program () Model Msg
    main =  Browser.sandbox
        { init = initialModel
            , view = view
            , update = update}
    

### Adding new dependency:  
    * **Error:** Need to add a source directory or new dependency to elm-package.json.
    * **Solution:** You can do that by doing `elm package install evancz/elm-effects `
        or by adding `evancz/elm-effects` to `elm-package.json` and then doing just elm package install.

### Downgrage from Elm 0.19 to 0.18 *[1]*  
    * **Solution:** If you have downloaded the `installer-for-mac.pkg` for installing Elm 0.19 follow:
        - Remove the `elm` binary from `/usr/local/bin`
        - Download Elm 0.18 installer from [here](https://web.archive.org/web/20180714175914id_/https://guide.elm-lang.org/install.html) and follow [this](https://web.archive.org/web/20180714175914id_/https://guide.elm-lang.org/) documentation.

### elm-package.json  
    * **Points to note:** 
        - If your code is in a src folder, change source directories from "." to "src".
        - 
Hello
        - hello
    -Hello