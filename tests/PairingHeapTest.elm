module PairingHeapTest exposing (all)

import Expect exposing (Expectation)
import Fuzz
import PairingHeap
import Test exposing (..)


all : Test
all =
    describe "PairingHeap"
        [ fuzz (Fuzz.list (Fuzz.map2 Tuple.pair Fuzz.int Fuzz.string))
            "stores and sorts key value pairs"
          <|
            \items ->
                PairingHeap.fromList items
                    |> PairingHeap.toSortedList
                    |> Expect.equal (List.sortBy Tuple.first items)
        ]
