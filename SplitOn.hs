module SplitOn where

splitOnHelper :: Char -> String -> [String] -> String -> [String]
--splitOnHelper delimeter "" outcome "" = tail $ outcome
--splitOnHelper delimeter "" outcome strThatWillBeAppended = tail $ outcome ++ [strThatWillBeAppended]
splitOnHelper delimeter [] outcome strThatWillBeAppended = outcome
splitOnHelper delimeter (x:[]) outcome strThatWillBeAppended = [(x:[])]
splitOnHelper delimeter (x:xs) outcome strThatWillBeAppended
	| elem delimeter (x:xs) /= True = [(x:xs)]
	| xs == ""                      = tail $ outcome ++ [strThatWillBeAppended]
	| x == delimeter                = splitOnHelper delimeter xs (outcome ++ [strThatWillBeAppended]) ""
	| otherwise                     = splitOnHelper delimeter xs outcome (strThatWillBeAppended ++ [x])

splitOn :: Char -> String -> [String]
splitOn delimeter text = splitOnHelper delimeter text [[]] []

splitOnNewLine :: String -> [String]
splitOnNewLine text = splitOn '\n' text

