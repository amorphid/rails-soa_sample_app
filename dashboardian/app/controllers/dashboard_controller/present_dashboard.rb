class DashboardController
  class PresentDashboard
    def present
      presenter(
        values(
          threads(
            fetchers)))
    end

    def fetchers
      [
        FetchBooksViaBooksApi.new,
        FetchRantsViaRantsApi.new
      ]
    end

    def presenter(values)
      Dashboard.new(*values)
    end

    def threads(fetchers)
      fetchers.map do |fetcher|
        Thread.new { fetcher.fetch }
      end
    end

    def values(threads)
      threads.map do |thread|
        thread.value
      end
    end
  end
end
