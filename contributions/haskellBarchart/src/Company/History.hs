{-| Charting of the historical salary data -} 

module Company.History (
  chart
) where

import Graphics.Rendering.Chart
import Data.Accessor
import GHC.Float

-- | Generate .png file for development of median
chart :: String -> String -> [(Int,Float)] -> IO ()
chart filename title values = do
  renderableToPNGFile (toRenderable layout) 640 480 filename
  return ()
    where
      layout
        = layout1_title ^= "Development of salaries over the years"
        $ layout1_plots ^= [ Left (plotBars bars) ]
        $ defaultLayout1 :: Layout1 Int Double
      bars
        = plot_bars_titles ^= [title]
        $ plot_bars_spacing ^= BarsFixGap 42 101
        $ plot_bars_style ^= BarsStacked
        $ plot_bars_values ^= values'
        $ defaultPlotBars
      values'
        = map (\(y,f) -> (y, [float2Double f])) values
