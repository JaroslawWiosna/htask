import CheckIfFileExists
import HomeDirectory
import System.Directory (doesFileExist)

main :: IO ()
main = do
	putStrLn "htask"
	(myHomeDirectory) >>= putStrLn
	check doesFileExist "README.md"

