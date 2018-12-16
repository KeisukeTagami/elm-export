module PostDecoderWithOptions exposing (..)

import CommentDecoder exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import PostType exposing (..)


succeedPost : Decoder Post
succeedPost =
    succeed Post
        |> required "postId" int
        |> required "postName" string
        |> required "postAge" (maybe float)
        |> required "postComments" (list succeedComment)
        |> required "postPromoted" (maybe succeedComment)
        |> required "postAuthor" (maybe string)
