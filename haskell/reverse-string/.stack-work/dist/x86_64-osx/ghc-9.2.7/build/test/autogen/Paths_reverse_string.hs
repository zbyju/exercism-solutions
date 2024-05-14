{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_reverse_string (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/zbynekjurica/Exercism/haskell/reverse-string/.stack-work/install/x86_64-osx/24f2323767d48705b613b49b919629c3f896e783c5fe684af25487a297b93c8d/9.2.7/bin"
libdir     = "/Users/zbynekjurica/Exercism/haskell/reverse-string/.stack-work/install/x86_64-osx/24f2323767d48705b613b49b919629c3f896e783c5fe684af25487a297b93c8d/9.2.7/lib/x86_64-osx-ghc-9.2.7/reverse-string-0.1.0.0-3xY7C3fCKAZ6wS8y5MBea-test"
dynlibdir  = "/Users/zbynekjurica/Exercism/haskell/reverse-string/.stack-work/install/x86_64-osx/24f2323767d48705b613b49b919629c3f896e783c5fe684af25487a297b93c8d/9.2.7/lib/x86_64-osx-ghc-9.2.7"
datadir    = "/Users/zbynekjurica/Exercism/haskell/reverse-string/.stack-work/install/x86_64-osx/24f2323767d48705b613b49b919629c3f896e783c5fe684af25487a297b93c8d/9.2.7/share/x86_64-osx-ghc-9.2.7/reverse-string-0.1.0.0"
libexecdir = "/Users/zbynekjurica/Exercism/haskell/reverse-string/.stack-work/install/x86_64-osx/24f2323767d48705b613b49b919629c3f896e783c5fe684af25487a297b93c8d/9.2.7/libexec/x86_64-osx-ghc-9.2.7/reverse-string-0.1.0.0"
sysconfdir = "/Users/zbynekjurica/Exercism/haskell/reverse-string/.stack-work/install/x86_64-osx/24f2323767d48705b613b49b919629c3f896e783c5fe684af25487a297b93c8d/9.2.7/etc"

getBinDir     = catchIO (getEnv "reverse_string_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "reverse_string_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "reverse_string_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "reverse_string_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "reverse_string_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "reverse_string_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
