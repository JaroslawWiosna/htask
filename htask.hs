import CheckIfFileExists
import HomeDirectory
import System.Directory (doesFileExist)
import ConfigFile
import System.IO
import Control.Monad

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

