module Games
  class Explore < ApplicationService
    def call(user)
      wallet = user.wallet
      fish = user.fishes.find_by(is_active: true)
      mineral_stock = user.mineral_stocks[0]

      requiredMoney = 1500
      requiredLevel = 3
      requiredMineral = 10

      if requiredMoney <= wallet.dsc && requiredLevel <= fish.level && requiredMineral <= mineral_stock.count
        wallet.update!(dsc: wallet.dsc - requiredMoney)
        mineral_stock.update!(count: mineral_stock.count - requiredMineral)

        final_explore_time = Time.now + fish.exploring_time
        call_job_time = Time.now + fish.exploring_time / 20 - 2

        fish.update!(final_explore_time: final_explore_time, explore_stage: 'exploring')
        ExploreJob.set(wait_until: call_job_time).perform_later(fish)

        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'money',
                                     message: "- #{requiredMoney}",
                                     createdAt: Time.now
                                   }
                                 })
        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'mineral',
                                     message: "+ #{requiredMineral}",
                                     createdAt: Time.now
                                   }
                                 })

      end
    end
  end
end
