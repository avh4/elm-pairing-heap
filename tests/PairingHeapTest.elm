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
        , test "merge with empty and non-empty" <|
            \() ->
                PairingHeap.merge
                    PairingHeap.empty
                    (PairingHeap.insert 1 "one" PairingHeap.empty)
                    |> PairingHeap.findMin
                    |> Expect.equal (Just ( 1, "one" ))
        , test "merge with non-empty and empty" <|
            \() ->
                PairingHeap.merge
                    (PairingHeap.insert 1 "one" PairingHeap.empty)
                    PairingHeap.empty
                    |> PairingHeap.findMin
                    |> Expect.equal (Just ( 1, "one" ))
        , test "merge non-empty heaps (first has smallest min value)" <|
            \() ->
                PairingHeap.merge
                    (PairingHeap.insert 1 "one" PairingHeap.empty)
                    (PairingHeap.insert 2 "two" PairingHeap.empty)
                    |> PairingHeap.deleteMin
                    |> PairingHeap.findMin
                    |> Expect.equal (Just ( 2, "two" ))
        , test "insert two values" <|
            \() ->
                PairingHeap.empty
                    |> PairingHeap.insert 2 "two"
                    |> PairingHeap.insert 1 "one"
                    |> PairingHeap.deleteMin
                    |> PairingHeap.findMin
                    |> Expect.equal (Just ( 2, "two" ))
        ]
