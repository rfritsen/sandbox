import scrapy

class AmazonReviewsSpider(scrapy.Spider):
  name = 'amazon_reviews'
  allowed_domains = ['amazon.de']
  myBaseUrl = "https://www.amazon.de/Neues-Apple-MacBook-256GB-Speicherplatz/product-reviews/B07S58MJHK/?reviewerType=all_reviews&pageNumber="
  start_urls=[]

  for n in range(100):
    start_urls.append(myBaseUrl+str(n))

  def parse(self, response):
    data = response.css('#cm_cr-review_list')
    reviews = data.css('.review-rating')
    comments = data.css('.review-text')

    # Combining the results
    for n, review in enumerate(reviews):
      yield{'stars': ''.join(review.xpath('.//text()').extract()),
        'comment': ''.join(comments[n].xpath(".//text()").extract())
        }

    __call__ = run 

test = AmazonReviewsSpider()
test()

