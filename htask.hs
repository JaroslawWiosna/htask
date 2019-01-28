import CheckIfFileExists
import HomeDirectory
import System.Directory (doesFileExist)
import ConfigFile
import System.IO
import Control.Monad
import System.Environment -- getArgs

listOfArgs :: IO String
listOfArgs = do
	args <- getArgs
	return (args !! 0)

printHelp :: String
printHelp = "htask help"

initialBranchPrintHelp :: String -> IO ()
initialBranchPrintHelp arg
	| arg == "help" = putStrLn printHelp
	| arg == "add"  = undefined
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
	let singleWords = words contents
	print singleWords
	arg0 <- listOfArgs
	initialBranchPrintHelp arg0	

