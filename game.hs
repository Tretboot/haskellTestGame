import System.Random

main = do
gen &lt;- newStdGen
let fragen = [&quot;Warum nicht?&quot;, &quot;Hast du das Spiel verstanden?&quot;, &quot;Wie geht es dir heute?&quot;]
(zufallszahl, _) = randomR (0, length fragen - 1) gen :: (Int, StdGen)
putStrLn &quot;Willst du gewinnen?&quot;
antwort &lt;- getLine
if antwort == &quot;Ja&quot;
then putStrLn &quot;Herzlichen Glückwunsch! Du hast gewonnen!&quot;
else spiel fragen zufallszahl

spiel fragen zufallszahl = do
putStrLn $ fragen !! zufallszahl
antwort &lt;- getLine
if antwort == &quot;Ja&quot;
then putStrLn &quot;Herzlichen Glückwunsch! Du hast gewonnen!&quot;
else spiel fragen (fst $ randomR (0, length fragen - 1) (snd $ random gen :: StdGen))
