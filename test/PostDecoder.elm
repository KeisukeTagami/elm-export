module PostDecoder exposing (..)

import CommentDecoder exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import PostType exposing (..)


succeedPost : Decoder Post
succeedPost =
    succeed Post
        |> required "id" int
        |> required "name" string
        |> required "age" (maybe float)
        |> required "comments" (list succeedComment)
        |> required "promoted" (maybe succeedComment)
        |> required "author" (maybe string)
