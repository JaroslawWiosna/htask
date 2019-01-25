import CheckIfFileExists
import System.Directory (doesFileExist)

main :: IO ()
main = do
	putStrLn "htask"
	check doesFileExist "README.md"

