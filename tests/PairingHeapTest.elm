module PairingHeapTest exposing (all)

import Expect exposing (Expectation)
import PairingHeap
import Test exposing (..)


all : Test
all =
    describe "PairingHeap"
        [ test "findMin on a non-empty heap" <|
            \() ->
                PairingHeap.empty
                    |> PairingHeap.insert 1 "one"
                    |> PairingHeap.findMin
                    |> Expect.equal (Just ( 1, "one" ))
        ]
