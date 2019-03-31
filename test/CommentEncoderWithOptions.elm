module CommentEncoderWithOptions exposing (..)

import CommentType exposing (..)
import Exts.Json.Encode exposing (..)
import Iso8601
import Json.Encode


encodeComment : Comment -> Json.Encode.Value
encodeComment x =
    Json.Encode.object
        [ ( "commentPostId", Json.Encode.int x.commentPostId )
        , ( "commentText", Json.Encode.string x.commentText )
        , ( "commentMainCategories", (tuple2 Json.Encode.string Json.Encode.string) x.commentMainCategories )
        , ( "commentPublished", Json.Encode.bool x.commentPublished )
        , ( "commentCreated", (Json.Encode.string << Iso8601.fromTime) x.commentCreated )
        , ( "commentTags", (dict Json.Encode.string Json.Encode.int) x.commentTags )
        ]
