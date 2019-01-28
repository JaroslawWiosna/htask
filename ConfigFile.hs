module ConfigFile where
import HomeDirectory

configFileName :: String
configFileName = ".htask"

getPathOfConfigFile :: IO String
getPathOfConfigFile = do
	myDir <- myHomeDirectory
	return $ myDir ++ "/" ++ configFileName





