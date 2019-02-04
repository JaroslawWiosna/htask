module TaskNext where
import ConfigFile
import System.IO
import SplitOn

taskNext :: IO ()
taskNext = do
	putStrLn "tasknext"
	pathOfConfigFile <- getPathOfConfigFile
	putStrLn $ "The content of " ++ pathOfConfigFile ++ " is:"
	handle <- openFile pathOfConfigFile ReadMode
	contents <- hGetContents handle
	putStrLn $ "--------"
	putStrLn contents
	putStrLn $ "--------"
	putStrLn $ head $ splitOnNewLine contents
