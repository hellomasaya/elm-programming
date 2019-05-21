module Main exposing (Model, Msg, init, view, update, subscriptions)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Array exposing (..)
import Stack exposing (..)
import Html exposing (..)

-- MAIN

main : Program Never Model Msg
main =
    Html.program{ init = init
        ,view = view
        ,update = update
        ,subscriptions = subscriptions
    }

  
subscriptions : Model -> Sub Msg
subscriptions model =
        Sub.none

-- MODEL

type alias Model =
    { temp : String  --goes in stack and gets updated
    , poppedNumber : Maybe String -- gets removed from stack and gets updated
    , stack : Stack String
    }

init : ( Model, Cmd Msg )
init = ( { temp = "", stack = Stack.initialise, poppedNumber = Nothing }
        , Cmd.none
        )

-- UPDATE
type alias StackData a =
    Array a

type Msg
    = Push | Pop | Temp String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Pop ->
            let
                returnStack =
                    Stack.pop model.stack
            in
                ( { model | stack = Tuple.second returnStack, poppedNumber = Tuple.first returnStack, temp = "" }, Cmd.none )

        Push ->
            let
                returnStack =
                    Stack.push model.temp model.stack
            in
                ( { model | stack = returnStack, temp = "" }, Cmd.none )

        Temp item ->
            ( { model | temp = item }, Cmd.none )

-- -- VIEW

stackViewHelp : Int -> String -> Html Msg
stackViewHelp i l =
    div []
        [ span [] [ i |> toString |> text ]
        , div [] [ text l ]
        ]

stackView : List String -> Html Msg
stackView data =
    let
        newlist =
            if List.length data < 10 then
                List.append data (Array.initialize (10 - List.length data) (always "") |> Array.toList)
            else
                data
    in
        div []
            [ div []
                (List.reverse
                    (List.indexedMap
                        stackViewHelp
                        newlist
                    )
                )
            ]

view : Model -> Html Msg
view model =
    div []
        [   div[] [stackView (Stack.toList model.stack)]
            , input [ type_ "text", value model.temp, onInput (\str -> Temp str) ] []
            , button [ onClick Push ] [ text "Push" ]
            , button [ onClick Pop ] [ text "Pop" ]
            , p [] 
              [text ("Popped: " ++ (Maybe.withDefault "" model.poppedNumber))]
        ]