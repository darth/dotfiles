set boxwidth hist_boxwidth * hist_binwidth
hist = 'u (hist_binwidth*(floor((column(hist_col)-hist_binstart)/hist_binwidth)+hist_binshift)+hist_binstart):(1.0) smooth freq w boxes'
hist_cumulative = 'u (hist_binwidth*(floor((column(hist_col)-hist_binstart)/hist_binwidth)+hist_binshift)+hist_binstart):(1.0) smooth cumulative w boxes'

hist_perc = 'u (hist_binwidth*(floor((column(hist_col)-hist_binstart)/hist_binwidth)+hist_binshift)+hist_binstart):(100.0/STATS_records) smooth freq w boxes'
hist_cumulative_perc = 'u (hist_binwidth*(floor((column(hist_col)-hist_binstart)/hist_binwidth)+hist_binshift)+hist_binstart):(100.0/STATS_records) smooth cumulative w boxes'
