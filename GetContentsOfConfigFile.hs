module GetContentsOfConfigFile where
import ConfigFile
import CheckIfFileExists
import HomeDirectory
import System.IO

getContentsOfConfigFile :: IO String
getContentsOfConfigFile = do
	pathOfConfigFile <- getPathOfConfigFile
	handle <- openFile pathOfConfigFile ReadMode
	contents <- hGetContents handle
	putStrLn contents
	--hClose handle
	return $ contents

