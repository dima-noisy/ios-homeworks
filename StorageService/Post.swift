import UIKit

public struct Post {
    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int
}

public let dataSource: [Post] = [
    Post(author: "Amur Leopard", description: "The Amur leopard (Panthera pardus orientalis) is a leopard subspecies native to the Primorye region of southeastern Russia and northern China. It is listed as Critically Endangered on the IUCN Red List, as in 2007, only 19–26 wild leopards were estimated to survive in southeastern Russia and northeastern China.", image: "AmurLeopard", likes: 177, views: 200),
    Post(author: "Pallas Cat", description: "The Pallas's cat (Otocolobus manul), also known as the manul, is a small wild cat with long and dense light grey fur, and rounded ears set low on the sides of the head. Its head-and-body length ranges from 46 to 65 cm (18 to 26 in) with a 21 to 31 cm (8.3 to 12.2 in) long bushy tail. It is well camouflaged and adapted to the cold continental climate in its native range, which receives little rainfall and experiences a wide range of temperatures.", image: "PallasCat", likes: 170, views: 201),
    Post(author: "Snow Leopard", description: "The snow leopard (Panthera uncia), commonly known as the ounce, is a species of large cat in the genus Panthera of the family Felidae. The species is native to the mountain ranges of Central and South Asia. It is listed as Vulnerable on the IUCN Red List because the global population is estimated to number fewer than 10,000 mature individuals and is expected to decline about 10% by 2040. It is mainly threatened by poaching and habitat destruction following infrastructural developments. It inhabits alpine and subalpine zones at elevations of 3,000–4,500 m (9,800–14,800 ft), ranging from eastern Afghanistan, the Himalayas and the Tibetan Plateau to southern Siberia, Mongolia and western China. In the northern part of its range, it also lives at lower elevations.", image: "SnowLeopard", likes: 160, views: 202),
    Post(author: "Leopard", description: "The leopard (Panthera pardus) is one of the five extant species in the genus Panthera. It has a pale yellowish to dark golden fur with dark spots grouped in rosettes. Its body is slender and muscular reaching a length of 92–183 cm (36–72 in) with a 66–102 cm (26–40 in) long tail and a shoulder height of 60–70 cm (24–28 in). Males typically weigh 30.9–72 kg (68–159 lb), and females 20.5–43 kg (45–95 lb).", image: "Leopard", likes: 150, views: 203)
]
