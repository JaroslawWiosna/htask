module SplitOn where

splitOnHelper :: Char -> String -> [String] -> String -> [String]
splitOnHelper delimeter (x:xs) outcome strThatWillBeAppended
	| xs == ""       = tail $ outcome ++ [strThatWillBeAppended]
	| x == delimeter = splitOnHelper delimeter xs (outcome ++ [strThatWillBeAppended]) ""
	| otherwise      = splitOnHelper delimeter xs outcome (strThatWillBeAppended ++ [x])

splitOn :: Char -> String -> [String]
splitOn delimeter text = splitOnHelper delimeter text [[]] []

splitOnNewLine :: String -> [String]
splitOnNewLine text = splitOn '\n' text

