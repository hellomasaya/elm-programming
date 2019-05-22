module ViewHelpers exposing (..)
import Array
import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


stackViewHelp : Int -> String -> Html Types.Msg
stackViewHelp i l =
    div [ class "stackitem" ]
        [ span [ class "stackindex" ] [ i |> toString |> text ]
        , div [ class "stackdata" ] [ text l ]
        ]


stackView : List String -> Html Types.Msg
stackView data =
    let
        newlist =
            if List.length data < 10 then
                List.append data (Array.initialize (10 - List.length data) (always "") |> Array.toList)
            else
                data
    in
        div [ class "row" ]
            [ div [ class "stackview col-sm-12 col-md-10 col-md-offset-1" ]
                (List.reverse
                    (List.indexedMap
                        stackViewHelp
                        newlist
                    )
                )
            ]


introView : Html Types.Msg
introView =
    div []
        [ div [ class "jumbotron" ]
            [ div [ class "container" ] [ h1 [] [ text "Stacks" ], p [] [ text """Stacks are dynamic data structures that follow the Last In First Out (LIFO) principle. 
The last item to be inserted into a stack is the first one to be deleted from it.
        """ ] ] ]
        ]