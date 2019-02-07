import CheckIfFileExists
import HomeDirectory
import ConfigFile
import TaskAdd
import TaskNext
import TaskDone

import System.Directory (doesFileExist)
import System.IO
import Control.Monad
import System.Environment -- getArgs

listOfArgs :: IO String
listOfArgs = do
	args <- getArgs
	return (args !! 0)

printHelp :: String
printHelp = "htask help"

initialBranch :: String -> IO ()
initialBranch arg
	| arg == "help" = putStrLn printHelp
	| arg == "add"  = taskAdd
	| arg == "next" = taskNext
	| arg == "done" = taskDone
	| otherwise     = undefined 

main :: IO ()
main = do
	putStrLn "htask"
	(myHomeDirectory) >>= putStrLn
	(getPathOfConfigFile) >>= putStrLn
	check doesFileExist "README.md"
	pathOfConfigFile <- getPathOfConfigFile
	handle <- openFile pathOfConfigFile ReadMode
	contents <- hGetContents handle
	hClose handle
	let singleWords = words contents
	print singleWords
	arg0 <- listOfArgs
	putStrLn "\n\n"
	initialBranch arg0	

