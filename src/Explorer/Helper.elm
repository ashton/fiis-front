module Explorer.Helper exposing (fundIndicative, indicativeComparison)

import Explorer.Types exposing (Fund, Indicative)


fundIndicative : Fund -> Explorer.Types.Indicative
fundIndicative fund =
    if fund.dy > 7 then
        if fund.priceIndicator <= 1 then
            Explorer.Types.Good

        else
            Explorer.Types.Medium

    else if fund.priceIndicator <= 1 then
        Explorer.Types.Medium

    else
        Explorer.Types.Bad


indicativeToValue : Indicative -> Int
indicativeToValue ind =
    case ind of
        Explorer.Types.Good ->
            2

        Explorer.Types.Medium ->
            1

        Explorer.Types.Bad ->
            0


indicativeComparison : Indicative -> Indicative -> Order
indicativeComparison indA indB =
    compare (indicativeToValue indA) (indicativeToValue indB)
