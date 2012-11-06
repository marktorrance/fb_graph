module FbGraph
  module Connections
    module AdAccounts
      def ad_accounts(options = {})
        ad_accounts = self.connection :adaccounts, options
        ad_accounts.map! do |ad_account|
          AdAccount.new ad_account[:id], ad_account.merge(
            :access_token => options[:access_token] || self.access_token
          )
        end
      end

      def ad_account!(options = {})
        ad_account = post options.merge(:connection => :adaccounts)
        AdAccount.new ad_account[:id], options.merge(ad_account).merge(
          :access_token => options[:access_token] || self.access_token
        )
      end

    end
  end
end

